(function($) {
    $.fn.tilda = function(eval, options) {
        if ($('body').data('tilda')) {
            return $('body').data('tilda').terminal;
        }
        this.addClass('tilda');
        options = options || {};
        eval = eval || function(command, term) {
            term.echo("you don't set eval for tilda");
        };
        var settings = {
            prompt: '$>',
            name: '$',
            height: 50,
            enabled: false,
            greetings: ''
        };
        if (options) {
            $.extend(settings, options);
        }
        this.append('<div class="td"></div>');
        var self = this;
        self.terminal = this.find('.td').terminal(eval, settings);
        var focus = false;

        self.toggle = function(focus) {
          self.slideToggle('fast');
          self.terminal.set_command('');
          self.terminal.focus(focus);

          self.terminal.attr({
              scrollTop: self.terminal.attr("scrollHeight")
          });
        }

        $.subscribe("console:show", function() { self.toggle(true); });
        $.subscribe("console:hidden", function() { self.toggle(false); });

        $('body').data('tilda', this);
        this.hide();
        return self;
    };
})(jQuery);


$(document).ready(function() {

  var TerminalCommandMapper = {
   find: function(input,terminal) {
     var definedCommands = Object.keys(this.commands);
     var regexInput = new RegExp(input);
     var matchedCommands = [];

     for (var i = 0; i < definedCommands.length; i++) {
       var currentCommand = definedCommands[i];
       if (regexInput.exec(currentCommand)) {
         matchedCommands.push(currentCommand);
       }
     }

     var unknownCommand = function() { terminal.echo('Unknown Command: ' + input); };
     var MultipleMatchCommand = function() { terminal.echo('Multiple commands matched: `' + input + '` - ' + matchedCommands); };

     var finalMatchedCommand = unknownCommand;

     if (matchedCommands.length == 1) {
       finalMatchedCommand = this.commands[ matchedCommands[0] ];
     } else if (matchedCommands.length > 1)  {
       finalMatchedCommand = MultipleMatchCommand
     }

     return finalMatchedCommand;
   },
   commands: TerminalCommands
  }

  $('#tilda').tilda(function(command, terminal) {
    if (command.length == 0) { return; }

    var tokens = command.split(' ');
    var name = tokens[0];
    var params = tokens.slice(1,tokens.length);

    var commandMatchingName = TerminalCommandMapper.find(name,terminal);
    commandMatchingName(params);
  });


});

!SLIDE bullets incremental

# faking

* classes can be faked as well<br />`fake :logger, as: :class`
* if the class name differs, pass it as a block<br />`fake(:logger) { LocalScriptorium }`
* ideally: fake roles, not classes<br />`fake(:logger) { [LocalScriptorium, ScriptsOverAvianCarriers] }`

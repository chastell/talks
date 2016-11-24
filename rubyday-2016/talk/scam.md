# what are integration tests<br />and why should I care?

<p class='quote'><span class='fragment'>Integration tests are
a scam</span><span class='fragment'>, a self-replicating virus</span><br
/><span class='fragment'>that threatens the very health of your
codebase</span><span class='fragment'>,<br /> your sanity</span><span
class='fragment'> and<br />– I’m not exaggerating when I say –<br
/>your life.<br /> — J. B. Rainsberger, _[Integration Tests Are
a Scam](http://www.infoq.com/presentations/integration-tests-scam)_</spa
n></p>


# types of tests

* (there’s a metric fucktonne of types, but…)
<!-- .element: class="fragment" -->

* end-to-end: does it boot and follows<br
/>hoppity-hop down the happy path?
<!-- .element: class="fragment" -->

* integration: are these two… three… few pieces<br
/> wired together properly and work as a whole?
<!-- .element: class="fragment" -->

* unit: does at least this one piece<br />work as it should? please…?
<!-- .element: class="fragment" -->


# why would you do that?

* end-to-end: things _actually work_<br />+
a fallback when they won’t<br />+ peace of mind
<!-- .element: class="fragment" -->

* integration: end-to-end are too slow;<br />are these few
coupled things<br />calling each other (the right) names?
<!-- .element: class="fragment" -->

* unit: ability to see *what* broke<br />+ peace-of-mind
when refactoring<br />+ outside-in development
<!-- .element: class="fragment" -->


## SPEED IS NOT THE REASON<br />FOR DOING UNIT TESTING

![speed](img/speed.gif)
<!-- .element: style="width: 50%" -->

## (but it is a fundamental side-effect)


# test doubles

* stand in for collaborators
<!-- .element: class="fragment" -->

* stubs: return a canned response
<!-- .element: class="fragment" -->

* mocks: verify a call was made
<!-- .element: class="fragment" -->


# test doubles isolate

<p class='fragment quote'>‘Resource temporarily unavailable’<br />is not an error
I want to see<br />coming out of the test suite.<br />— Avdi Grimm</p>

<p class='fragment quote'>Testing an object that depends on 14 database
tables.<br />If I had a time machine I’d go back and punch<br
/>the original developer in my face.<br />— David Brady</p>



# _[POODR](http://www.poodr.com)_ wisdom

* if Command-Query Separation…
<!-- .element: class="fragment" -->

* …outgoing query calls: stubs<br />(no
side effects, important return value)
<!-- .element: class="fragment" -->

* …outgoing command calls: mocks<br />(‘no’
return value, important side effects)
<!-- .element: class="fragment" -->

* outgoing non-CQS calls:<br />mocks with return values?
<!-- .element: class="fragment" -->

* test incoming calls to public API of the object
<!-- .element: class="fragment" -->


# J. B. Rainsberger wisdom

* basic correctness: given the myth of perfect
technology do we compute the right answer?
<!-- .element: class="fragment" -->

* object under test: are you making the right call?
<!-- .element: class="fragment" -->

* object under test: can you handle the response?
<!-- .element: class="fragment" -->

* collaborator: can you handle the call?
<!-- .element: class="fragment" -->

* collaborator: do you give the right response?
<!-- .element: class="fragment" -->


# heavy use of doubles

* required to drive design from outside in
<!-- .element: class="fragment" -->

* required to isolate in unit tests
<!-- .element: class="fragment" -->

* hide mismatches → green suite, unbootable app
<!-- .element: class="fragment" -->

* false sense of security → shattered trust
<!-- .element: class="fragment" -->


# double trouble

* what if the outgoing call is wrong?
<!-- .element: class="fragment" -->

* what if the outgoing call is right<br
/> but the collaborator can’t handle it?
<!-- .element: class="fragment" -->

<p class='quote fragment'><code>describe 'mocks and stubs
are connected correctly' do</code><br />— Florian Gilcher</p>


# (all the wrong) solutions

* I know! end-to-end tests will catch it!
<!-- .element: class="fragment" -->

* (no they won’t, you can’t<br />really test all the code paths)
<!-- .element: class="fragment" -->

* oh, so *that’s* why we need integration tests!
<!-- .element: class="fragment" -->

* (except they test way too much at once *and*<br />
you still can’t really test all the code paths)
<!-- .element: class="fragment" -->


## TALC IS CHEAP
<!-- .element: class="fragment" data-fragment-index="0" -->

![talc](img/talc.jpg)

## SHOW ME THE CODE
<!-- .element: class="fragment" data-fragment-index="0" -->


# disclaimer:<br />(some) bad OO design<br />and suboptimal<br />testing practices<br />(might’ve been) introduced<br />for the sake of simplicity

# bloc_flutter

Implementation of the toggle button using the BLoC pattern.

## Introduction

Below is an example of implementation on the dart program language of toggle button using the BLoC pattern.  The class ButtonPattern encapsulates the state machine shown below.

## State machine

![button_state_machine.svg](..%2F..%2FArchive%2FNUC%2FIdeaProjects%2Fbutton_state_machine.svg)

It has two states: play and stop (on and off) and is controlled by two events: click and reset.  The first event is used to switch the button from the stop state to play and vice versa, the second event is used to reset the button to the initial stop state using some external influence.
To illustrate, the application uses two flat buttons: stop/play button as a toggle button and refresh button - for simulate external influence.  Naturally, the proposed implementation method can be extended to any other types of buttons of flutter or widgets.
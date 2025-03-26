[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/gbHItYk9)
## Project 00
### NeXTCS
### Period: 10
## Name0: Eviss Wu
## Name1: Sebastian Tecza
---

This project will be completed in phases. The first phase will be to work on this document. Use github-flavoured markdown. (For more markdown help [click here](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) or [here](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax) )

All projects will require the following:
- Researching new forces to implement.
- Method for each new force, returning a `PVector`  -- similar to `getGravity` and `getSpring` (using whatever parameters are necessary).
- A distinct demonstration for each individual force (including gravity and the spring force).
- A visual menu at the top providing information about which simulation is currently active and indicating whether movement is on or off.
- The ability to toggle movement on/off
- The ability to toggle bouncing on/off
- The user should be able to switch _between_ simluations using the number keys as follows:
  - `1`: Gravity
  - `2`: Spring Force
  - `3`: Drag
  - `4`: Custom Force
  - `5`: Combination


## Phase 0: Force Selection, Analysis & Plan
---------- 

#### Custom Force: Electrostatic Force

### Forumla
What is the formula for your force? Including descriptions/definitions for the symbols. (You may include a picture of the formula if it is not easily typed.)

(kq1q2)/(r^2)

### Custom Force
- What information that is already present in the `Orb` or `OrbNode` classes does this force use?
  - center

- Does this force require any new constants, if so what are they and what values will you try initially?
  - k, and we will use 9 * 10^9 and charge using the value for one elementary charge

- Does this force require any new information to be added to the `Orb` class? If so, what is it and what data type will you use?
  - int charge

- Does this force interact with other `Orbs`, or is it applied based on the environment?
  - other Orbs

- In order to calculate this force, do you need to perform extra intermediary calculations? If so, what?
  - Calculate how applyForce will effect a specific object.

--- 

### Simulation 1: Gravity
Describe how you will attempt to simulate orbital motion.

We will use the equation g(m1*m2)/r^2 to simulate gravity and have each orb of the orbList effect each other orb once.

--- 

### Simulation 2: Spring
Describe what your spring simulation will look like. Explain how it will be setup, and how it should behave while running.

Depending on the length of each spring between the orbs, there will be a force applied, for example if the spring is elongated, a force will bring them together, and viee versa for compression. On the screen, it should look like 2 lines between the orbs that will change color based on length compared to original length.

--- 

### Simulation 3: Drag
Describe what your drag simulation will look like. Explain how it will be setup, and how it should behave while running.

The drag should constantly lower the directional velocity of all orb objects when it is on, and it should appear as if each orb is slowing down the more they travels.

--- 

### Simulation 4: Custom force
Describe what your Custom force simulation will look like. Explain how it will be setup, and how it should behave while running.

The charge will be an integer and depending on that integer, we will use our charge equation as labelled above to attract/repel orbs from each other.

--- 

### Simulation 5: Combination
Describe what your combination simulation will look like. Explain how it will be setup, and how it should behave while running.

All of the forces will be running as stated above however, we expect for the electromagnetic force to be stronger than gravity.


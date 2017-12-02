# SVA-Based Techniques To Generate Automatic Directed Test-Cases

Proposed By: Dr. Khaled Salah Mohamed

**Khaled_mohamed@mentor.com**

## Motivation

Verification is the bottleneck process in any IP life cycle. Reducing the overall verification effort and time to market is a must. We need to replace the manual effort of creating stimulus by an automatic method. A SystemVerilog assertion-based technique is proposed to generate automatic stimulus.

## Target

To implement a SystemVerilog assertion-based tool which is able to generate automatic stimulus for any RTL design. The generation process is using a set of transformation rules to generate directed tests that will cover all the functionalities of the RTL design in less time than normal methods. To the best of our knowledge, there are no previous works that can automatically generate RTL tests from the SystemVerilog assertions. Moreover, in this work we will provide case studies to prove the powerful results of our methodology. The first step in the proposed methodology is to write SystemVerilog assertions to captures all the properties of the SoC design. These assertions are based on the testplan. The next step is to define a set of transformation rules that can generate the direct tests. The main transformation rules include: add reset sequence by default, add delay if necessary before applying the stimulus.

## Plan

* Study of SystemVerilog.
* Study of Perl scripting and wx widgets or Python.
* Study of different verification testbenches.
* Writing assertion to an industrial IP.
* Proposing the detailed methodology to generate testcases from assertions.
* Implementing the methodology and measuring the coverage.
* Performance comparison between this automatic solution and other-solutions such as hand-crafted testcase generation or UVM-Based testcases generation.

## Deliverable

* A GUI-based tool.
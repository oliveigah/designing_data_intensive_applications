# 1 - Reliable, Scalable, and Maintainable Applications

- Usually we are not limited by raw CPU power anymore
- Amount, complexity and transfer speed of data are more usual limiting factors
- This new problem drives most of modern system's architectures
- Because of it data systems such as databases, caches, queues, stream processing, etc, are so common that they are considered obvious

## 1.1 - Thinking About Data Systems

- Although we usually think about different data systems (queues, databases, caches, etc) as being completely different because of their specifications, access patterns, performance and implementation differences, it is useful to refer about them as only data system because:
    - The line between "classes" of systems such as queues, caches, databases, is blur. There are caches that are used as queues (redis) and queues that offer durability as databases (kafka)
    - A single tool is not enough for most of the workloads and different tools must be glued together by application code

- When you glue multiple data systems together using application code, your application is kind of a new special purpose data system built on top of many others general purpose data systems

- Because of it, your application needs to address many trick questions that are common for all data systems

- This questions usually have one of three categories:
    - Reliability: Keep working properly even when something bad happens
    - Scalability: Can handle increases of load by reasonable increase of resources
    - Maintainability: New people can productively work on the system

## 1.2 - Reliability

- Reliability can be simplified to: "continuing to work correctly, even when things go wrong"
- "Things that go wrong" are usually called faults, so a reliable system is a fault tolerant one
- It is not feasible to built an absolute fault tolerant system, so we have to make choices and predict what can go wrong and be tolerant about some set of faults
- So when a system is so called fault tolerant is important to note tolerant about what?
- Failures are different from faults:
    - Faults are related to a component of the system deviating from expected behaviour
    - Failures is when your system deviates from expected behaviour failing to provide its service for its clients
    - Faults are inevitable
    - Failures may be avoided
    - Therefore a fault tolerant system avoid failures even when faults happen
- This is so important that a common strategy to test system's resilience is to deliberately force unexpected behaviours and see what happens

### 1.2.1 - Hardware Faults
- Hardware redundancy and fast restores are enough for most applications 
- Cloud platforms are usually designed with a focus on flexibility and elasticity, so modern applications are being designed to tolerate loss of an entire machine
- Tolerate a total loss of an entire machine brings some other hidden benefits regarding operations with rolling upgrades

### 1.2.2 - Software Faults
- In contrast with hardware faults that are usually random, software faults may impact many components at the same time
- Because of it, software faults usually are worse than hardware faults
- Software faults commonly go unnoticed until some particular circumstance triggers something and some system's expectation about the environment is no longer true
- In order to prevent software faults everything must be taken into account and the solutions are very context specific, some techniques are:
    - Careful application design
    - Comprehensive testing
    - Process isolation
    - Crash and restart
    - Comprehensive observability
    - Preventive monitoring

### 1.2.3 - Human Faults
- One study shows that most outages happen due to human faults (specially configuration)
- It is very tricky to prevent human errors but here is some approaches:
    - Minimize error by API design
    - Provide sandbox environments
    - Comprehensive tests
    - Fast and easy recovery of common human faults
    - Comprehensive observability
    - Management practices and training

### 1.2.4 - How Important is Reliability?
- In some cases this is obvious such as critical apps like nuclear power plants, but even normal apps have big impacts with it
- As everything reliability is often a tradeoff and therefore its requirements must be thought wisely and context dependent

## 1.3 - Scalability
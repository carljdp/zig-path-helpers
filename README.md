# [zig-path-helpers](https://github.com/carljdp/zig-path-helpers)

## Overview

zig-path-helpers is a collection of helper functions, structs, and types aimed at simplifying file and directory operations in Zig.

## Disclaimer

While some functions in this project may already exist in Zig's standard library, this project serves as my personal interpretation and learning experiment. I'm still learning Zig, and I believe there's room for improvement or additional features in the standard library's current implementation.

## Planned Features

The iterations/featuresets below are purposefully tightly constrained to allow for persistent/granular progress.

### MVP

#### Constraints

- Support only local filesystem paths
- Support only Windows style paths
- Support only UTF-8 encoded paths (implicitly includes ASCII)

#### Immediate goals

- [ ] Path struct
- [ ] Validate input
  - [ ] is utf8/ascii chars
  - [ ] is not reserved chars
- [ ] Join 2 paths

### Future

- Add support for POSIX style paths
- Many more helper functions planned..

## Dev Guide

```shell
git clone https://github.com/yourusername/zig-path-helpers.git
cd zig-path-helpers
zig build test --summary all
```

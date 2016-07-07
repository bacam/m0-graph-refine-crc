The CRC code is taken from the [Mälardalen WCET benchmark
suite](http://www.mrtc.mdh.se/projects/wcet/benchmarks.html), but altered to
remove undefined behaviour, use `int` instead of `short` (which is not fully
supported) and move `static` arrays out to global variables.

The C parsing and graph export code in `CRC.thy` is based on the examples in
the `graph-refine` repository and the SEL4 code.  The `target.py` driver is
based on the `graph-refine` ones, but has a little extra code added to ignore
the cycle counter variable in loops.

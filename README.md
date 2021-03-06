Calculate second lowest cost silver plan (SLCSP)
================================================

Problem
-------

You have been asked to determine the second lowest cost silver plan (SLCSP) for
a group of ZIP Codes.

Task
----

You have been given a CSV file, `slcsp.csv`, which contains the ZIP Codes in the
first column. Fill in the second column with the rate (see below) of the
corresponding SLCSP. Your answer is the modified CSV file, plus any source code
used.

Write your code in your best programming language.

The order of the rows in your answer file must stay the same as how they
appeared in the original `slcsp.csv`.

If no SLCSP can be determined for a ZIP Code, leave the cell blank (no quotes or
zeroes or other text).

It may not be possible to determine a SLCSP for every ZIP Code given -- what
reason or reasons are there? Fill in your explanation(s) below.

    Reason: There could only be one value for that zipcode so you cant find the
    second lowest one. Also, not all zip codes could have had a silver plan sold
    within that zipcode, ergo it doesnt exist.


Additional information
----------------------

The SCLSP is the so-called "benchmark" health plan in a particular area. It is
used to compute the tax credit that qualifying individuals and families receive
on the marketplace.

A plan has a "metal level", which can be either Bronze, Silver, Gold, Platinum,
or Catastrophic. The metal level is indicative of the level of coverage the plan
provides.

A plan has a "rate", which is the amount that a consumer pays as a monthly
premium, in dollars.

A plan has a "rate area", which is a geographic region in a state that
determines the plan's rate. A rate area is a tuple of a state and a number, for
example, NY 1, IL 14.

There are two additional CSV files in this directory besides `slcsp.csv`:

  * `plans.csv` -- all the health plans in the U.S. on the marketplace
  * `zips.csv` -- a mapping of ZIP Code to county/counties & rate area(s)

A ZIP Code can potentially be in more than one county. If the county can not be
determined definitively by the ZIP Code, it may still be possible to determine
the rate area for that ZIP Code.

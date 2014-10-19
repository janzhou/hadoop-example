Hadoop Example
==============

Make sure paths in ``Makefile`` are right:

    HADOOP = hadoop
    HDFS   = hdfs
    YARN   = yarn
    TEST_DIR = /janzhou-hadoop-example

Compile
-------

    make

Prepare test data
-----------------

    make parpare

Run the test
------------

    make test

Clean all the files (including test data)
-----------------------------------------

    make clean

Results
-------

The results is located under ``test/result`` in local.

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

    make prepare

Run the test
------------

    make test

The results is located under ``test/result`` in local.

Clean all the files (including test data)
-----------------------------------------

    make clean


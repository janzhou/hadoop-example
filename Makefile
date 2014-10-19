HADOOP = hadoop
HDFS   = hdfs
YARN   = yarn
TEST_DIR = /janzhou-hadoop-example
 
APP = hadoop-example.jar
SRC = src/*.java 
OUT = out
 
$(APP): $(SRC) 
	mkdir -p $(OUT) 
	javac -classpath `$(HADOOP) classpath` -d $(OUT) $(SRC) 
	jar -cvf $(APP) -C $(OUT) .

prepare:
	$(HDFS) dfs -mkdir $(TEST_DIR)
	$(HDFS) dfs -mkdir $(TEST_DIR)/wordcount
	$(HDFS) dfs -mkdir $(TEST_DIR)/wordcount/input
	$(HDFS) dfs -copyFromLocal LICENSE $(TEST_DIR)/wordcount/input
	$(HDFS) dfs -mkdir $(TEST_DIR)/matrixmultiplic
	$(HDFS) dfs -mkdir $(TEST_DIR)/matrixmultiplic/input
	$(HDFS) dfs -copyFromLocal test/Matrix.txt $(TEST_DIR)/matrixmultiplic/input
 
test: $(APP)
	$(YARN) jar hadoop-example.jar org.janzhou.WordCount $(TEST_DIR)/wordcount/input $(TEST_DIR)/wordcount/output
	$(YARN) jar hadoop-example.jar org.janzhou.MatrixMultiplication $(TEST_DIR)/matrixmultiplic/input $(TEST_DIR)/matrixmultiplic/output
	$(HDFS) dfs -copyToLocal $(TEST_DIR)/wordcount/output/part-r-00000 test/result/wordcount.txt
	$(HDFS) dfs -copyToLocal $(TEST_DIR)/matrixmultiplic/output/part-r-00000 test/result/matrixmultiplic.txt

clean: 
	rm -rf $(OUT) *.jar
	$(HDFS) dfs -rm -r $(TEST_DIR)

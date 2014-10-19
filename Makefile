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
 
test: $(APP)
	$(YARN) jar hadoop-example.jar org.janzhou.WordCount $(TEST_DIR)/wordcount/input $(TEST_DIR)/wordcount/output

clean: 
	rm -rf $(OUT) *.jar
	$(HDFS) dfs -rm -r $(TEST_DIR)

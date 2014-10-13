HADOOP = hadoop
 
APP = hadoop-example.jar
SRC = src/*.java 
OUT = out
 
$(APP): $(SRC) 
	mkdir -p $(OUT) 
	javac -classpath `$(HADOOP) classpath` -d $(OUT) $(SRC) 
	jar -cvf $(APP).jar -C $(OUT) .
 
run: $(APP)
	$(HADOOP) jar hadoop-example.jar org.janzhou.WordCount /wordcount/input /wordcount/output

clean: 
	rm -rf $(OUT) *.jar

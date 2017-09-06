start_time=$(date +%s)

java -jar etapa2.jar -i grafGenerate.graphml -o arch -p

finish_time=$(date +%s)
echo "Duración: $((finish_time - start_time)) segundos."

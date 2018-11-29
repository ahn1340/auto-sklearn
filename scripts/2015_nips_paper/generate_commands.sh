rm commands.txt # delete if there exists the file.

# create a bash iterable from a python list.
task_ids=($(python generate_task_ids.py | tr -d '[],'))

# generate commandline commands which reproduces Figure 3 in Robust Efficient Automated Machine Learning
# integrate over seed, then task, then model (vanilla, ensemble, metalearning, ensemble + metalearning)

#task_ids="3 5 7 8"

for seed in {0..9}; do
    for task_id in ${task_ids[@]}; do
        for model in 1 2 3 4; do # 1=vanilla, 2=ensemble, 3=metalearning, 4=ensemble+metalearning
            cmd="python score_auto_sklearn.py --seed $seed --task-id $task_id --working-directory log_output --model_config $model"
            echo $cmd >> commands.txt
        done
    done
done

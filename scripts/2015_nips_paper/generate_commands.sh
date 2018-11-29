#rm commands.txt
#for bench in Branin Bohachevsky Camelback Forrester GoldsteinPrice Hartmann3 Hartmann6 Levy Rosenbrock SinOne SinTwo; do
#    for seed in {11..32}; do
#        for predict_incumbent in True False; do
#            for do_hpo in True False; do
#                for reinterpolation in False; do
#                    for bootstrap in True False; do
#                        for new_search in True False; do
#                            if [ "$do_hpo" == "False" ] && [ "$reinterpolation" == "True" ]; then
#				continue
#			    fi
#                            if [ "$do_hpo" == "False" ] && [ "$reinterpolation" == "False" ] && [ "$new_search" == "False" ] && [ "$bootstrap" == "True" ]; then
#				continue
#			    fi
#                            #if [ "$reinterpolation" == "False" ] && [ "$bootstrap" == "True" ]; then
#                            #    continue
#                            #fi
#                            cmd="python scripts/run.py  --benchmark $bench --n_parallel 1 --repetitions 1 --smac_path smacs/SMAC/smac3/ --first_n $seed --predict_incumbent $predict_incumbent --do_hpo $do_hpo --reinterpolation $reinterpolation --bootstrap $bootstrap --new_search $new_search"
#                            echo $cmd >> commands.txt
#                        done
#                    done
#                done
#            done
#        done
#    done
#done

#models=['score_auto_sklearn.py', 'score_ensemble.py', 'score_metalearning.py', 'score_meta_ensemble.py']

# generate commandline commands which reproduces Figure 3 in Robust Efficient Automated Machine Learning
# integrate over seed, then task, then model (vanilla, ensemble, metalearning, ensemble + metalearning)

task_ids="3 5 7 8"

for seed in {0..9}; do
    for task_id in $task_ids; do
        for model in 1 2 3 4; do # 1=vanilla, 2=ensemble, 3=metalearning, 4=ensemble+metalearning
            cmd="python score_auto_sklearn.py --task-id $task_id --seed $seed --working-directory log_output -- model_config $model"
            echo $cmd
        done
    done
done

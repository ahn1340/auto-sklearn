import csv

def generate_task_ids(datasets_file):
    # Takes datasets.csv as input and returns list of task ids which are used to iterate over in reproducing the result.
    # Assumes that all entries of datasets_file looks like /datasets/openml/'task_id'+ '_' + 'metric'.
    task_ids = []

    with open(datasets_file) as f:
        reader = csv.reader(f)
        for row in reader: # parse each row of the file.
            task_id, _, metric = row[0].split(('/'))[2].partition('_') # parse task ID
            task_ids.append(int(task_id))

    return task_ids


print(generate_task_ids("datasets.csv"))

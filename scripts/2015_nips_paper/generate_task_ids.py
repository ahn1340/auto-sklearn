import csv

def generate_task_ids(file):
    # Takes datasets.csv as input and returns list of task ids which are used to iterate over in reproducing the result.
    task_ids = []

    with open(file) as f:
        reader = csv.reader(f) # iterate over lines of the file
        for row in reader:
            task_id, _, metric = row[0].split(('/'))[2].partition('_') # parse task ID
            task_ids.append(task_id)

    return task_ids


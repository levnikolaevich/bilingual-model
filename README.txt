Steps to complete the task:
1. To carry out the task, I chose 2 models designed for machine translation from here: https://huggingface.co/Helsinki-NLP. 
One model is for translating from Spanish to Russian, and the other is from Russian to Spanish.

2. From the website https://opus.nlpl.eu/results/es&ru/corpus-result-table, I downloaded the News-Commentary dataset, which contains line-by-line translations of news articles from Spanish to Russian in the moses format.

3. I processed the downloaded dataset with commands from a *.sh file, which I modified for my needs. After cleaning the dataset and shuffling the lines in it, I saved 25,000 lines to reduce the file sizes. 
I have only 2 files from which I form all the necessary datasets. Both bilingual and monolingual, which I use to create synthetic data. 
Having 2 files allows me to flexibly increase the dataset sizes if technical resources are available for model training.

Since I work on the Windows operating system, I used Git Bash in the folder with the text corpora to execute commands from the *.sh file.

I added the "cleaned" and prepared datasets for training to the apln folder on Google Disk for further work with them.

4. Next, I modified the code as follows:
- I loaded and checked the operation of both models on translating a simple example from the source language to the target. I received a satisfactory result.
- I prepared datasets for fine-tuning both models. This included allocating 2,500 sentences for back-translation for each language so that they did not overlap. I had to reduce the number of lines from 5,000 due to the limited resources of Google Colab.
- I performed an evaluation of both models before fine-tuning. All evaluation data are collected at the end of the file in a table. *Previously, when testing a model designed for translating from English to Spanish, I received a BLEU score of 40%, which was higher than the results of the models chosen for the current task.
- Since fine-tuning and evaluation of models are performed several times, based on the code provided in the task, I created methods that can be called as needed, passing the required variables as parameters. Moreover, fine-tuning is only performed if it has not been done for the model before.

5. Next, I further trained the base models on bilingual data and conducted a new evaluation of the models (results at the end).
6. To obtain synthetic data, I created a method that takes a dataset with the source language and returns a dataset ready for use in training (with a translation for each line). A model that performs the text translation is also passed as input.
7. At the end of the colab file, I wrote code that, over 3 iterations, trains the models on the synthetic dataset in combination with the bilingual dataset (a total of 5,000 lines). Training in each iteration occurs over 3 epochs for each model. The synthetic dataset is formed anew on each iteration by the model created in the previous iteration. Before fine-tuning, the dataset with synthetic data is merged with the bilingual dataset.
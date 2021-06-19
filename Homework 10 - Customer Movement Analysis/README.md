## Customer Movement

## Dataset
The data comes from supermarket dataset from DunnHumby. You can get the file as link. >> https://www.dunnhumby.com/source-files/

## Methodology
Tools: Google BigQuery and Google Colab
- Imported data to Google BigQuery
- Create customer movement view by grouped customer into 4 categories:

![image](https://user-images.githubusercontent.com/78214709/122635100-2e357480-d10c-11eb-89d3-a58c078dfa04.png)

-- Current: made purchases this month (M)
-- Previous: made purchases last month (M-1)
-- Before: made purchase before last month (< M-1)

- Export data into csv format and plot graph using Google Colab

## Result

![image](https://user-images.githubusercontent.com/78214709/122601887-2d64fa00-d09c-11eb-856a-c23975abd2a0.png)


def get_the_first_day_of_current_month():
    import datetime
    return datetime.date.today().replace(day=1)

# get the first day timestamp of last month
def get_the_first_day_of_last_month():
    import datetime
    return (datetime.date.today().replace(day=1) - datetime.timedelta(days=1)).replace(day=1)

x = get_the_first_day_of_last_month()
print(x)
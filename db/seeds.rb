# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Etf.find_or_create_by(ticker: 'SPY', name: 'SPDR S&P 500 ETF', fiduty_name: 'Benchmark', description: 'Our most popular offering, Benchmark is world famous as an investment fund. It is composed of 500 large US companies, and it has set a performance standard in its lifetime. Long-term, this fund is exceedingly difficult to beat.')
# Etf.find_or_create_by(ticker: 'TAN', name: 'Guggenheim Solar ETF', fiduty_name: 'Clean Energy', description: 'If you are someone who considers themselves socially responsible and you want to be active in making a positive impact on the planet, Clean Energy could be the right choice for you. The emphasis here is on decreasing our carbon footprint.')
# Etf.find_or_create_by(ticker: 'QQQ', name: 'PowerShares QQQ ETF', fiduty_name: 'Technology Mix', description: 'Tracking a variety of technology companies, Technology Mix is popular among young people for connecting them to the companies that touch their lives the most, including Facebook, Google, Apple, and Tesla.')
# Etf.find_or_create_by(ticker: 'VWO', name: 'Vanguard FTSE Emerging Markets ETF', fiduty_name: 'Roller Coaster', description: 'To the risk-takers belong the greatest rewards. If you can handle the pressure of a high-risk investment, then this is the fund for you, investing heavily in emerging markets, which are known for failing often and quickly but also for winning big sometimes.')
# Etf.find_or_create_by(ticker: 'VEA', name: 'Vanguard FTSE Developed Markets ETF', fiduty_name: 'Advanced Economies', description: 'You do not need to invest in Canada or the United States alone. There are other strong, developed options overseas, and this fund will give you access to those options so that you can diversify confidently.')
# Etf.find_or_create_by(ticker: 'VNQ', name: 'Vanguard REIT ETF', fiduty_name: 'Property Tycoon', description: 'There is an old saying about land: they’re not making any more of it! Even if you are not a homeowner yet, you probably understand just what a crucial investment real estate can be. This includes hotels, malls, office space, warehouse, and other real estate.')
# Etf.find_or_create_by(ticker: 'VUG', name: 'Vanguard Growth ETF', fiduty_name: 'Growth Hacking', description: 'While there is a definite time and place to seek out a stream of payments, there are benefits to leaving your investments alone and letting them develop. This fund collects strong, innovative companies such as Facebook, Google, and Disney for that purpose.')
# Etf.find_or_create_by(ticker: 'VTV', name: 'Vanguard Value ETF', fiduty_name: 'Undervalued Stocks', description: 'There are undervalued buys out there, and if you can find them for yourself, you can turn a healthy profit off investing in them. That is what this fund does, saving you the work of picking out such solid bets as ExxonMobil, Wells Fargo, and Johnson & Johnson.')
# Etf.find_or_create_by(ticker: 'VIG', name: 'Vanguard Dividend Appreciation ETF', fiduty_name: 'Money Makes Money', description: 'Think about the name of this fund and smile. For the few companies that have increased their annual dividends consistently, it is an adage to live by. The emphasis here is on iconic brands such as IBM, Coca-Cola, and Procter & Gamble.')
# Etf.find_or_create_by(ticker: 'RSP', name: 'Guggenheim S&P 500 Equal Weight', fiduty_name: 'Ole’ America', description: 'Known for the quality of its industrial sector, the US has a reputation that is hard to beat when it comes to putting out products. Investment in this fund is heavily centered around materials and financials.')
# Etf.find_or_create_by(ticker: 'VGENX', name: 'Vanguard Energy Fund Investor Shares', fiduty_name: 'Fossil Fuels', description: 'Oil, natural gas, and coal are going to continue to play chief roles in the world economy for a long time to come, and you can be a part of it. Invested mainly in foreign companies, this fund emphasizes the things that keep our world running.')
# Etf.find_or_create_by(ticker: 'IYT', name: 'iShares transportation average ETF', fiduty_name: 'Logistics', description: 'How do you get from point A to point B? There are many valid answers to that question today, and this fund has a piece in each of them, with sizable investments in airlines, trucking companies, and railroad companies.')
# Etf.find_or_create_by(ticker: 'XLV', name: 'Health Care Select Sector SPDR Fund', fiduty_name: 'Healthcare', description: 'Healthcare companies are there to help us when we need help most. It is a big responsibility, but someone has to do it. By investing in this fund, you can be a part of that and play a role in the system that keeps us all alive.')
# Etf.find_or_create_by(ticker: 'ITB', name: 'iShares U.S. Home Construction ETF', fiduty_name: 'Home Builders', description: 'Think back to your first childhood home: what did it look like? How many amazing memories did you make there? Now think of the people that made it come to life. This fund is your chance to invest in those construction companies.')

# Etf.find_or_create_by(ticker: 'XLB', name: 'Materials Select Sector SPDR', fiduty_name:'Raw Materials', description: 'Materials are used for everything: chemistry, constructions, packaging, and much, much more. Every industry is connected to the materials sector in one way or another, and this fund will grow for you as long as keep growing themselves.')
# Etf.find_or_create_by(ticker: 'IYZ', name: 'iShares US Telecommunications ETF', fiduty_name: 'Telecommunications')
# Etf.find_or_create_by(ticker: 'FXU', name: '', fiduty_name: 'Utilities', description: 'Electricity, gas, and the other utilities define our modern world, and wireless technology is redefining it. For an inexpensive (accessible) and highly liquid (flexible) fund, this one is a solid choice.')
# Etf.find_or_create_by(ticker: 'XLY', name: 'Consumer Discretionary Select Sector SPDR Fund (ETF)', fiduty_name: 'Consumer Discretionary', description: 'As long as the economy is working as it should be, people will continue to spend their money on cards, entertainment, and other luxury items. This fund is based on that condition: people having money to burn.')
# Etf.find_or_create_by(ticker: 'KXI', name: 'iShares S&P Global Consumer Staples ETF', fiduty_name: 'Consumer Staples', description: 'Even if the economy were to turn south, there would still be items that people needed to buy, items that keep them alive. This fund revolves mainly around food companies, plus household items and tobacco companies.')
# Etf.find_or_create_by(ticker: 'XLK', name: 'Technology Select Sector SPDR® ETF', fiduty_name: 'Information Technology', description: 'Technology has rapidly transformed the US economy, and that transformation is still in media res, altering the ways that we interact with each other and with the world. In this fund, Apple, Alphabet, Microsoft, and Facebook reign supreme.')
# Etf.find_or_create_by(ticker: 'DIA', name: 'SPDR Dow Jones Industrial Average ETF Trust', fiduty_name: 'Dow Jones Index', description: 'This is it, the big one. Made up of thirty companies known for their long-term health, the Dow Jones Index sets the standard upon which the rest of the economic forecast is based. To be in the middle of things, this is the right choice. ')


## questions
question1 = Question.find_or_create_by(question: "What is you goal of investing?")
choice1 = Choice.create(question: question1, choice: 'General Savings')
choice2 = Choice.create(question: question1, choice: 'Retirement')
choice3 = Choice.create(question: question1, choice: 'Beating the market')
choice4 = Choice.create(question: question1, choice: 'Other')

question2 = Question.find_or_create_by(question: "In how many years you will most likely start needing the money that you have invested?")
choice1 = Choice.create(question: question2, choice: 'Less than 3 years')
choice2 = Choice.create(question: question2, choice: 'Between 3 to 5 years')
choice3 = Choice.create(question: question2, choice: '5 to 10 years')
choice4 = Choice.create(question: question2, choice: 'More than 10 years')

question3 = Question.find_or_create_by(question: "What is your age?")

question4 = Question.find_or_create_by(question: "What is your annual income?")

question5 = Question.find_or_create_by(question: "Household description")
choice1 = Choice.create(question: question5, choice: 'Single income, no dependents')
choice2 = Choice.create(question: question5, choice: 'Single income, more than 1 dependent')
choice3 = Choice.create(question: question5, choice: 'Dual income, no dependents')
choice4 = Choice.create(question: question5, choice: 'Dual income, more than 1 dependent')
choice4 = Choice.create(question: question5, choice: 'Financially independent')

question6 = Question.find_or_create_by(question: "Total amount of cash and liquid investments")

question7 = Question.find_or_create_by(question: "When deciding how to invest your money, which do you care the most?")
choice1 = Choice.create(question: question7, choice: 'Maximize gains')
choice2 = Choice.create(question: question7, choice: 'Minimize losses')
choice3 = Choice.create(question: question7, choice: 'Both equally')


question8 = Question.find_or_create_by(question: "If market swings a lot and if you lose 10% of your investments, what would you do?")
choice1 = Choice.create(question: question8, choice: 'Sell all your investments')
choice2 = Choice.create(question: question8, choice: 'Keep all')
choice3 = Choice.create(question: question8, choice: 'Buy more')

question9 = Question.find_or_create_by(question: "How long do you plan to keep your money")

question9 = Question.find_or_create_by(question: "How long do you plan to keep your money")

question9 = Question.find_or_create_by(question: "How long do you plan to keep your money")




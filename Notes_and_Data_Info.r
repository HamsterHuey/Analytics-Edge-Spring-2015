Headline Starts with: How, Why, Should, What, Can, When, Was
> table(NewsTrain$Popular, grepl('^(How|Why|Should|What|Can|When|Was) .*$', NewsTrain$Headline))
   
    FALSE TRUE
  0  5216  223
  1   982  111

  
First word ending in -ing
> table(NewsTrain$Popular, grepl('^[a-zA-Z]*ing ', NewsTrain$Headline))
   
    FALSE TRUE
  0  5106  333
  1  1010   83


Brackets ( ) in Headline
> table(NewsTrain$Popular, grepl('^.*\\(.*\\).*$', NewsTrain$Headline))
   
    FALSE TRUE
  0  5403   36
  1  1071   22
  

Ends with Exclamation !  (Not enough stats in training set)
> table(NewsTrain$Popular, grepl('^.+!$', NewsTrain$Headline))
   
    FALSE TRUE
  0  5430    9
  1  1086    7

Single quotes in headlines ' ', or &lsquo; &rsquo;
> table(NewsTrain$Popular, grepl("^.*('|&lsquo;).*('|&rsquo;).*$", NewsTrain$Headline))
   
    FALSE TRUE
  0  5037  402
  1   997   96


"Reader" or "Comment" in headline
> table(NewsTrain$Popular, grepl('^.*(Comment|Comments).*$', NewsTrain$Headline))
   
    FALSE TRUE
  0  5420   19
  1  1079   14
> table(NewsTrain$Popular, grepl('^.*(Reader|Readers).*$', NewsTrain$Headline))
   
    FALSE TRUE
  0  5420   19
  1  1079   14

  

# Breakdown of classification as function of various independent variables
tapply(NewsTrain$Popular, as.factor(NewsTrain$SubsectionName), mean)
                       Asia Pacific          Dealbook         Education   Fashion & Style          Politics 
       0.20306672        0.01477833        0.09243697        0.00000000        0.00000000        0.00000000 
  Room For Debate    Small Business The Public Editor 
       0.01612903        0.03571429        0.80000000 

tapply(NewsTrain$Popular, as.factor(NewsTrain$SectionName), mean)
                             Arts     Business Day Crosswords/Games           Health         Magazine 
     0.056086957      0.074074074      0.085164835      0.837398374      0.618556701      0.000000000 
      Multimedia    N.Y. / Region             Open          Opinion           Sports            Style 
     0.014184397      0.085858586      0.000000000      0.700164745      0.000000000      0.000000000 
      Technology           Travel             U.S.            World 
     0.151515152      0.008547009      0.198019802      0.014150943 
	 
tapply(NewsTrain$Popular, as.factor(NewsTrain$NewsDesk), mean)
             Business    Culture    Foreign   Magazine      Metro   National       OpEd    Science 
0.07367281 0.15956072 0.07396450 0.00800000 0.00000000 0.08585859 0.00000000 0.78310940 0.62371134 
    Sports     Styles     Travel     TStyle 
0.00000000 0.34006734 0.00862069 0.01243094 

tapply(NewsTrain$Popular, NewsTrain$Weekday, mean)
        0         1         2         3         4         5         6 
0.3205128 0.1748366 0.1462185 0.1609477 0.1587948 0.1383162 0.2736842 

# Important factors:
Section Name: Crosswords/Games (0.837398374, 123), Health (0.618556701, 194), Opinion (0.700164745, 607)
SubSection Name: The Public Editor (0.80000000, 20)
NewsDesk: OpEd (0.78310940, 521), Science (0.62371134, 194), Styles (0.34006734, 297), Business (0.15956072, 1548)



# Breakdown of number of articles (counts) per independent variable
table(HeadlineWordsTrain$SectionName)
                             Arts     Business Day Crosswords/Games           Health         Magazine 
            2300              675             1092              123              194               31 
      Multimedia    N.Y. / Region             Open          Opinion           Sports            Style 
             141              198                4              607                1                2 
      Technology           Travel             U.S.            World 
             330              117              505              212 
			 
table(HeadlineWordsTrain$SubsectionName)
                       Asia Pacific          Dealbook         Education   Fashion & Style          Politics 
             4826               203               952               325                 2                 2 
  Room For Debate    Small Business The Public Editor 
               62               140                20 
			   
table(HeadlineWordsTrain$NewsDesk)
         Business  Culture  Foreign Magazine    Metro National     OpEd  Science   Sports   Styles   Travel 
    1846     1548      676      375       31      198        4      521      194        2      297      116 
  TStyle 
     724 
	 
table(HeadlineWordsTrain$Weekday)
   0    1    2    3    4    5    6 
 312 1224 1190 1224 1228 1164  190 

# WordCount should be replaced by log(WordCount) to make it have normal distribution as seen by hist() plot

# Adding prefix to colnames when combining multiple bag of word analysis (multiple dtm)
colnames(dtmTitle) = paste0("T", colnames(dtmTitle))
colnames(dtmAbstract) = paste0("A", colnames(dtmAbstract))

==========================================
> table(NewsTrain$Popular, grepl('^.*(iOS).*$', NewsTrain$Abstract, ignore.case=FALSE))
   
    FALSE TRUE
  0  5438    1
  1  1090    3
  
> table(NewsTrain$Popular, grepl('^.*(frack).*$', NewsTrain$Headline, ignore.case=TRUE))
   
    FALSE TRUE
  0  5439    0
  1  1091    2

  
> table(NewsTrain$Popular, grepl('^.*(obamacare).*$', NewsTrain$Headline, ignore.case=TRUE))
   
    FALSE TRUE
  0  5439    0
  1  1088    5

> table(NewsTrain$Popular, grepl('^.*(racism).*$', NewsTrain$Headline, ignore.case=TRUE))
   
    FALSE TRUE
  0  5438    1
  1  1089    4   

> table(NewsTrain$Popular, grepl('^.*(inequality).*$', NewsTrain$Headline, ignore.case=TRUE))
   
    FALSE TRUE
  0  5436    3
  1  1088    5
  
> table(NewsTrain$Popular, grepl('^.*(sexual).*$', NewsTrain$Headline, ignore.case=TRUE))
   
    FALSE TRUE
  0  5434    5
  1  1088    5
  
> table(NewsTrain$Popular, grepl('^.*(geithner).*$', NewsTrain$Headline, ignore.case=TRUE))
   
    FALSE TRUE
  0  5439    0
  1  1091    2

  ------------------------------------------------------------
> table(NewsTrain$Popular, grepl('^(Morning Agenda).*$', NewsTrain$Headline, ignore.case=TRUE))
   
    FALSE TRUE
  0  5377   62
  1  1093    0

> table(NewsTrain$Popular, grepl('^(First Draft Focus).*$', NewsTrain$Headline, ignore.case=TRUE))
   
    FALSE TRUE
  0  5396   43
  1  1093    0

> table(NewsTrain$Popular, NewsTrain$WordCount==0)
   
    FALSE TRUE
  0  5351   88
  1  1093    0
  
> table(NewsTrain$Popular, grepl('^(Daily Report).*$', NewsTrain$Headline, ignore.case=TRUE))
   
    FALSE TRUE
  0  5379   60
  1  1093    0
  
> table(NewsTrain$Popular, grepl('^(Behind the cover story).*$', NewsTrain$Headline, ignore.case=TRUE))
   
    FALSE TRUE
  0  5431    8
  1  1093    0
  
> table(NewsTrain$Popular, grepl('^(Q\\. and A\\.).*$', NewsTrain$Headline, ignore.case=TRUE))
   
    FALSE TRUE
  0  5419   20
  1  1093    0
  
> table(NewsTrain$Popular, grepl('^(New York Today).*$', NewsTrain$Headline, ignore.case=TRUE))
   
    FALSE TRUE
  0  5379   60
  1  1090    3
  
> table(NewsTrain$Popular, grepl('^([0-9]+:).*$', NewsTrain$Headline, ignore.case=TRUE))
   
    FALSE TRUE
  0  5273  166
  1  1093    0
  
> table(NewsTrain$Popular, grepl('^(In performance).*$', NewsTrain$Headline, ignore.case=TRUE))
   
    FALSE TRUE
  0  5425   14
  1  1093    0
  
> table(NewsTrain$Popular, grepl('^(today in small business).*$', NewsTrain$Headline, ignore.case=TRUE))
   
    FALSE TRUE
  0  5381   58
  1  1093    0

> table(NewsTrain$Popular, grepl("today in", NewsTrain$Headline, ignore.case = TRUE))
   
    FALSE TRUE
  0  5333  106
  1  1093    0
  
> table(NewsTrain$Popular, grepl('^(Weekly Quandary).*$', NewsTrain$Headline, ignore.case=TRUE))
   
    FALSE TRUE
  0  5439    0
  1  1088    5

> table(NewsTrain$Popular, grepl('^.*(Fashion Week).*$', NewsTrain$Headline, ignore.case=TRUE))
   
    FALSE TRUE
  0  5255  184
  1  1093    0

> table(NewsTrain$Popular, grepl('^(Think Like a Doctor).*$', NewsTrain$Headline, ignore.case=TRUE))
   
    FALSE TRUE
  0  5439    0
  1  1087    6

> table(NewsTrain$Popular, grepl('^(Popcast).*$', NewsTrain$Headline, ignore.case=TRUE))
   
    FALSE TRUE
  0  5430    9
  1  1093    0

> table(NewsTrain$Popular, grepl('^.*(pictures).*$', NewsTrain$Headline, ignore.case=TRUE))
   
    FALSE TRUE
  0  5372   67
  1  1093    0

> table(NewsTrain$Popular, grepl('^.*(\\|).*$', NewsTrain$Headline, ignore.case=TRUE))
   
    FALSE TRUE
  0  5180  259
  1  1092    1

> table(NewsTrain$Popular, grepl('^.*(photograph).*$', NewsTrain$Headline, ignore.case=TRUE))
   
    FALSE TRUE
  0  5416   23
  1  1093    0
  
# OpEd pieces
> table(NewsTrain$Popular, grepl('^(Facts & Figures).*$', NewsTrain$Headline, ignore.case=TRUE))
   
    FALSE TRUE
  0  5438    1
  1  1088    5

> table(FinalTrain$Popular, grepl('^.*(tribun).*$', NewsTrain$Abstract, ignore.case = TRUE))
   
    FALSE TRUE
  0  5276  163
  1  1093    0
  
> table(FinalTrain$Popular, grepl('^.*(pari).*$', NewsTrain$Headline, ignore.case = TRUE))
   
    FALSE TRUE
  0  5337  102
  1  1093    0
  
> table(FinalTrain$Popular, grepl('^.*(dail).*$', NewsTrain$Headline, ignore.case = TRUE))
   
    FALSE TRUE
  0  5287  152
  1  1093    0
  
> table(FinalTrain$Popular, grepl('^.*(2015).*$', NewsTrain$Headline, ignore.case = TRUE))
   
    FALSE TRUE
  0  5298  141
  1  1093    0
  
> table(FinalTrain$Popular, grepl('^.*(christma).*$', NewsTrain$Abstract, ignore.case = TRUE))
   
    FALSE TRUE
  0  5407   32
  1  1093    0
  
> table(FinalTrain$Popular, grepl('^.*(collect).*$', NewsTrain$Abstract, ignore.case = TRUE))
   
    FALSE TRUE
  0  5271  168
  1  1093    0

> table(FinalTrain$Popular, grepl('^.*(email).*$', NewsTrain$Abstract, ignore.case = TRUE))
   
    FALSE TRUE
  0  5359   80
  1  1093    0
  
> table(FinalTrain$Popular, grepl('^.*(hong).*$', NewsTrain$Abstract, ignore.case = TRUE))
   
    FALSE TRUE
  0  5362   77
  1  1092    1
  
> table(FinalTrain$Popular, grepl('^.*(music).*$', NewsTrain$Abstract, ignore.case = TRUE))
   
    FALSE TRUE
  0  5333  106
  1  1091    2
  
> table(FinalTrain$Popular, grepl('(^pari|^.* pari).*$', NewsTrain$Abstract, ignore.case = TRUE))
   
    FALSE TRUE
  0  5337  102
  1  1091    2
  
> table(FinalTrain$Popular, grepl('^.*(scene).*$', NewsTrain$Abstract, ignore.case = TRUE))
   
    FALSE TRUE
  0  5276  163
  1  1092    1
  
> table(NewsTrain$Popular, grepl("of the day", NewsTrain$Headline, ignore.case = TRUE))
   
    FALSE TRUE
  0  5321  118
  1  1093    0
  
> table(NewsTrain$Popular, grepl("review", NewsTrain$Headline, ignore.case = TRUE))
   
    FALSE TRUE
  0  5391   48
  1  1093    0
  
> table(NewsTrain$Popular, grepl("appeared in", NewsTrain$Abstract, ignore.case = TRUE))
   
    FALSE TRUE
  0  5369   70
  1  1093    0
  ==================================================================


> table(NewsTrain$Popular, grepl('^.*(readers respond).*$', NewsTrain$Headline, ignore.case=TRUE))
   
    FALSE TRUE
  0  5429   10
  1  1084    9
  
> table(NewsTrain$Popular, grepl('^.*(comments).*$', NewsTrain$Headline, ignore.case=TRUE))
   
    FALSE TRUE
  0  5427   12
  1  1087    6
  
> table(NewsTrain$Popular, grepl('^.*(breach).*$', NewsTrain$Headline, ignore.case=TRUE))
   
    FALSE TRUE
  0  5431    8
  1  1089    4
  

> table(NewsTrain$Popular, grepl('^.*(readers).*$', NewsTrain$Headline, ignore.case=TRUE))
   
    FALSE TRUE
  0  5422   17
  1  1081   12 
  
> table(NewsTrain$Popular, grepl('^.*(obama ).*$', NewsTrain$Headline, ignore.case=TRUE))
   
    FALSE TRUE
  0  5382   57
  1  1084    9
  

  
> table(NewsTrain$Popular, grepl('^.*(respond).*$', NewsTrain$Headline, ignore.case=TRUE))
   
    FALSE TRUE
  0  5419   20
  1  1083   10


  
> table(NewsTrain$Popular, grepl('^.*(hack).*$', NewsTrain$Headline, ignore.case=TRUE))
   
    FALSE TRUE
  0  5426   13
  1  1087    6
  
> table(NewsTrain$Popular, grepl('^.*(wall st).*$', NewsTrain$Headline, ignore.case=TRUE))
   
    FALSE TRUE
  0  5414   25
  1  1081   12
  

  
> table(NewsTrain$Popular, grepl('^.*(benefit).*$', NewsTrain$Headline, ignore.case=TRUE))
   
    FALSE TRUE
  0  5432    7
  1  1089    4
  
> table(NewsTrain$Popular, grepl('^.*(college).*$', NewsTrain$Headline, ignore.case=TRUE))
   
    FALSE TRUE
  0  5429   10
  1  1087    6
  
> table(NewsTrain$Popular, grepl('^.*(amazon).*$', NewsTrain$Headline, ignore.case=TRUE))
   
    FALSE TRUE
  0  5423   16
  1  1086    7
  
> table(NewsTrain$Popular, grepl('^.*(ebola).*$', NewsTrain$Headline, ignore.case=TRUE))
   
    FALSE TRUE
  0  5373   66
  1  1071   22
  
> num_commas = sapply(regmatches(NewsTrain$Headline, gregexpr(",", NewsTrain$Headline)), length)
> tapply(NewsTrain$Popular, num_commas, mean)
        0         1         2         3         4 
0.1645234 0.1820728 0.1626506 0.1666667 0.0000000 
> table(num_commas)
num_commas
   0    1    2    3    4 
5288 1071  166    6    1 


==============================================
misses = (predict(FinalRFCaretNoDtm, newdata=FinalTrainNoDtm, type='prob')[,2]>0.5) != (FinalTrain$Popular==1)
incorrect_classification = data.frame(FinalTrainNoDtm[misses, ], NewsTrain[misses, c('Popular', 'Headline', 'Abstract')])

Breakdown of Classifications:
dtmFinal[dtmFinal$NewsDesk=='TStyle',]$SectionName = 'TStyle'
dtmFinal[dtmFinal$NewsDesk=='TStyle',]$SubsectionName = 'TStyle'
dtmFinal[dtmFinal$NewsDesk=='Styles',]$SectionName = 'U.S.'
dtmFinal[dtmFinal$NewsDesk=='Styles',]$SubsectionName = 'Fashion & Style'
dtmFinal[dtmFinal$NewsDesk=='Foreign',]$SectionName = 'World'
dtmFinal[dtmFinal$NewsDesk=='Foreign' & dtmFinal$SubsectionName=='',]$SubsectionName = 'SUBWorld'
dtmFinal[dtmFinal$NewsDesk=='Culture',]$SectionName = 'Arts'
dtmFinal[dtmFinal$SectionName=='Arts',]$SubsectionName = 'SUBArts'
dtmFinal[dtmFinal$NewsDesk=='Business' & dtmFinal$SectionName=='',]$SubsectionName = 'Dealbook'
dtmFinal[dtmFinal$NewsDesk=='Business' & dtmFinal$SectionName=='',]$SectionName = 'Business Day'
dtmFinal[dtmFinal$SubsectionName=='',]$SubsectionName = dtmFinal[dtmFinal$SubsectionName=='',]$SectionName

> table(FinalTrain$SectionName, FinalTrain$NewsDesk)
                  
                        Business Culture Foreign Magazine Metro National OpEd Science Sports Styles Travel TStyle
                   1284        5       1     163        0     0        2    1       2      1    117      0    724
  Arts                0        0     675       0        0     0        0    0       0      0      0      0      0
  Business Day        1     1091       0       0        0     0        0    0       0      0      0      0      0
  Crosswords/Games    1      122       0       0        0     0        0    0       0      0      0      0      0
  Health              1        0       0       0        0     0        0    0     192      0      1      0      0
  Magazine            0        0       0       0       31     0        0    0       0      0      0      0      0
  Multimedia        141        0       0       0        0     0        0    0       0      0      0      0      0
  N.Y. / Region       0        0       0       0        0   198        0    0       0      0      0      0      0
  Open                4        0       0       0        0     0        0    0       0      0      0      0      0
  Opinion            87        0       0       0        0     0        0  520       0      0      0      0      0
  Sports              0        0       0       0        0     0        0    0       0      1      0      0      0
  Style               0        0       0       0        0     0        0    0       0      0      2      0      0
  Technology          0      330       0       0        0     0        0    0       0      0      0      0      0
  Travel              1        0       0       0        0     0        0    0       0      0      0    116      0
  U.S.              326        0       0       0        0     0        2    0       0      0    177      0      0
  World               0        0       0     212        0     0        0    0       0      0      0      0      0

table(FinalTrain$SubsectionName, FinalTrain$SectionName)
                         Arts Business Day Crosswords/Games Health Magazine Multimedia N.Y. / Region Open Opinion Sports Style Technology Travel U.S.	World
                    2300  675            0              123    194       31        141           198    4     525      1     0        330    117  178	9
  Asia Pacific         0    0            0                0      0        0          0             0    0       0      0     0          0      0    0	203
  Dealbook             0    0          952                0      0        0          0             0    0       0      0     0          0      0    0	0
  Education            0    0            0                0      0        0          0             0    0       0      0     0          0      0  325	0
  Fashion & Style      0    0            0                0      0        0          0             0    0       0      0     2          0      0    0	0
  Politics             0    0            0                0      0        0          0             0    0       0      0     0          0      0    2	0
  Room For Debate      0    0            0                0      0        0          0             0    0      62      0     0          0      0    0	0
  Small Business       0    0          140                0      0        0          0             0    0       0      0     0          0      0    0	0
  The Public Editor    0    0            0                0      0        0          0             0    0      20      0     0          0      0    0	0
View(NewsTrain[NewsTrain$SectionName == 'U.S.',c('Popular', 'Headline', 'Abstract')])
  
- All FOREIGN NewsDesk to WORLD SectionName
- All CULTURE NewsDesk to ARTS SectionName
- All NATIONAL NewsDesk to U.S. SectionName
- All OPED NewsDesk to OPINION SectionName
- ALL SCIENCE NewsDesk to HEALTH SectionName
- All STYLES NewsDesk to U.S. SectionName
- ALL TSTYLE NewsDesk to new factor TSTYLE SectionName

- OPED NewsDesk has only OPINION SectionName and "" SubsectionName
	- --> "Small Business" and "The Public Editor" could be promote to NewsDesk variables as top-level classes
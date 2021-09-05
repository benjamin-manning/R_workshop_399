d = read.csv("experiment.csv")
d %>% mutate(permin = persec/60) %>% summarise(mean(permin)) %>% round(2)
d %>% group_by(female) %>% summarise(mage= mean(age)) %>% pull(mage) %>% diff() %>% abs() %>% round(2)
dr = d %>% 
  mutate(se3 = 8 - se3,se5 = 8- se5, se7 = 8 - se7) %>% 
  gen_comp(se, quos(se1,se2,se3,se4,se5,se6,se7,se8))
m = dr %>% filter(age > 30, con == 1) %>% summarise(mean(se))
f = dr %>% filter(age < 40, con == 2) %>% summarise(mean(se))
abs(m-f) %>% round(2)
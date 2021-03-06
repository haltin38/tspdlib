new;
cls;
library tspdlib;

// Load date file
y = loadd(__FILE_DIR $+ "TSe.dat");

/*
** Maximum number of lags for ds; 
** 0=no lags
*/
pmax = 12;                 

/*
** Information Criterion: 
** 1=Akaike; 
** 2=Schwarz; 
** 3=t-stat sign.
*/
ic = 3;                 

// Trimming rate
trimm = 0.10;             

format /m1 /rd 8,4;

/*
** 1=Model A: break in level  
** 2=Model C: break in level and trend
*/
model = 1;                  

if model == 1; "--------Model A: Break in level        -----"; endif;
if model == 2; "--------Model C: Break in level & trend-----"; endif;
    
"One break ADF test (Zivot & Andrews, 1992)";
    { ADF_min, tb1, p, cv }=ADF_1break(y, model, pmax, ic, trimm);
    "       ADF-stat        ";;ADF_min;
    "       Break date      ";;tb1;
    "       Fraction (λ)    ";;tb1/rows(y);
    "       Lag             ";;p;
    "       CV (1%, 5%, 10%)";;cv';
"";
    
/*
** 1=Model A: break in level  
** 2=Model C: break in level and trend
*/
model = 2;                  

if model == 1; "--------Model A: Break in level        -----"; endif;
if model == 2; "--------Model A: Break in level & trend-----"; endif;
    
"One break ADF test (Zivot & Andrews, 1992)";
    { ADF_min, tb1, p, cv }=ADF_1break(y, model, pmax, ic, trimm);
    "       ADF-stat        ";;ADF_min;
    "       Break date      ";;tb1;
    "       Fraction (λ)    ";;tb1/rows(y);
    "       Lag             ";;p;
    "       CV (1%, 5%, 10%)";;cv';
"";

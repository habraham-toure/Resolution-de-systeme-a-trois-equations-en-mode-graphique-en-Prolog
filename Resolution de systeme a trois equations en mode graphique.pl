
/* PROGRAMME COMPLET */ 
showForm :-
    new(D, dialog('Résoltion de systeme d''‚équations a 3 inconnues de type AX = C', size(1900, 300))),


 new(H1, dialog_group(' A')),
        send(H1, gap, size(5, 5)),
    new(H2, dialog_group(' X')),
        send(H2, gap, size(5, 5)),
        new(H3, dialog_group('  C')),
        send(H3, gap, size(5, 5)),
        new(H4, dialog_group(' ')),
        send(H4, gap, size(5, 5)),
    send(D, append, H1),
    send(D, append, H2, right),
        send(D, append, H3, right),
        send(D, append, H4),



    new(TextA11, text_item('a11')),
        send(TextA11, width(5)),
    send(H1, append, TextA11),
        send(H1, append, TextA11),
        new(TextA12, text_item('a12')),
        send(TextA12, width(5)),
    send(H1, append, TextA12, right),
        new(TextA13, text_item('a13')),
        send(TextA13, width(5)),
    send(H1, append, TextA13, right),
        
        new(TextA21, text_item('a21')),
        send(TextA21, width(5)),
    send(H1, append, TextA21),
        new(TextA22, text_item('a22')),
        send(TextA22, width(5)),
    send(H1, append, TextA22, right),
        new(TextA23, text_item('a23')),
        send(TextA23, width(5)),
    send(H1, append, TextA23, right),
        
        new(TextA31, text_item('a31')),
        send(TextA31, width(5)),
    send(H1, append, TextA31),
        new(TextA32, text_item('a32')),
        send(TextA32, width(5)),
    send(H1, append, TextA32, right),
        new(TextA33, text_item('a33')),
        send(TextA33, width(5)),
    send(H1, append, TextA33, right),

/* affichage de la case du determiant */  
new(Det, text_item('Determinant')),
        send(Det, width(5)),
    send(H4, append, Det),

/* affichage de la matrice X */  

        new(TextX1, text_item('X1')),
        send(TextX1, width(25)),
    send(H2, append, TextX1),
        new(TextX2, text_item('X2')),
        send(TextX2, width(25)),
    send(H2, append, TextX2),
        new(TextX3, text_item('X3')),
        send(TextX3, width(25)),
    send(H2, append, TextX3),

/*Affichage de la matrice C*/     
        new(TextC1, text_item('C1')),
        send(TextC1, width(5)),
    send(H3, append, TextC1),
        new(TextC2, text_item('C2')),
        send(TextC2, width(5)),
    send(H3, append, TextC2),
        new(TextC3, text_item('C3')),
        send(TextC3, width(5)),
    send(H3, append, TextC3),
     
    send(D, append, button(annuler, message(D, destroy))),   
   send(D, append,button(calculer, 
                               message(@prolog, solution,
                                TextA11?selection, 
                                TextA12?selection,
                                TextA13?selection, 
                                TextA21?selection,
                                TextA22?selection, 
                                TextA23?selection,
                                TextA31?selection, 
                                TextA32?selection,
                                TextA33?selection, 
                                TextC1?selection, 
                                TextC2?selection, 
                                TextC3?selection, 
                                Det,
                                TextX1,
                                TextX2,
                                TextX3
                                ))),
    
    send(D, open).

/*Manipulations pour l'obtention des résultats*/


% Le pr‚dicat de calcul de lexpression
calcule(Atom, A) :-
      term_to_atom(Expr, Atom),
      A is Expr.

% le pr‚dicat dinteraction entre la fenetre et le predicat fenetre
solution(Expr1, Expr2, Expr3, Expr4, Expr5, Expr6, Expr7, Expr8, Expr9, Expr10, Expr11, Expr12, Determinant, TextX1, TextX2,TextX3) :-
        calcule(Expr1, Res1),
        calcule(Expr2, Res2),
        calcule(Expr3, Res3),
        calcule(Expr4, Res4),
        calcule(Expr5, Res5),
        calcule(Expr6, Res6),
        calcule(Expr7, Res7),
        calcule(Expr8, Res8),
        calcule(Expr9, Res9),
        calcule(Expr10, Res10),
        calcule(Expr11, Res11),
        calcule(Expr12, Res12),
        
/* Determinant */        
        Det1 is (Res1 * Res5) * Res9,
        Det2 is (Res2 * Res6) * Res7,
        Det3 is (Res3 * Res4) * Res8,
        Det4 is (Res7 * Res5) * Res3,
        Det5 is (Res8 * Res6) * Res1,
        Det6 is (Res9 * Res4) * Res2,

        D1 is (Res10 * Res5) * Res9,
        D2 is (Res2 * Res6) * Res12,
        D3 is (Res3 * Res11) * Res8,
        D4 is (Res12 * Res5) * Res3,
        D5 is (Res8 * Res6) * Res10,
        D6 is (Res9 * Res11) * Res2, 

        L1 is (Res1 * Res11) * Res9,
        L2 is (Res10 * Res6) * Res7,
        L3 is (Res3 * Res4) * Res12,
        L4 is (Res7 * Res11) * Res3,
        L5 is (Res12 * Res6) * Res1,
        L6 is (Res9 * Res4) * Res10,


        M01 is (Res1 * Res5) * Res12,
        M02 is (Res2 * Res11) * Res7,
        M03 is (Res10 * Res4) * Res8,
        M04 is (Res10 * Res5) * Res7,
        M05 is (Res1 * Res11) * Res8,
        M06 is (Res2 * Res4) * Res12,








        Add1 is Det1 + (Det2 + Det3),
        Add2 is Det4 + (Det5 + Det6),
       
        Ad1 is D1 + (D2 + D3),
        Ad2 is D4 + (D5 + D6),

        A1 is L1 + (L2 + L3),
        A2 is L4 + (L5 + L6),

        A01 is M01 + (M02 + M03),
        A02 is M04 + (M05 + M06),

        
        Res is Add1 - Add2,
        Rs is Ad1 - Ad2,
        Res0 is Rs / Res,
        As is A1 - A2,
        Resu is As / Res,
        Rss is A01 - A02,
        Rssi is Rss / Res,

        sformat(Str1, '~w', [Res0]),  % le r‚sultat est ‚crit dans une chaŒne de caractŠres        
        send(TextX1, selection, Str1),    % on envoie au label Resultat la chaŒne
         sformat(Str2, '~w', [Resu]),  % le r‚sultat est ‚crit dans une chaŒne de caractŠres        
        send(TextX2, selection, Str2),    % on envoie au label Resultat la chaŒne
        sformat(Str, '~w', [Res]),  % le r‚sultat est ‚crit dans une chaŒne de caractŠres        
        send(Determinant, selection, Str),   % on envoie au label Resultat la chaŒne
        sformat(Str3, '~w', [Rssi]),  % le r‚sultat est ‚crit dans une chaŒne de caractŠres        
        send(TextX3, selection, Str3).    % on envoie au label Resultat la chaŒne



/**/
        
/*.........................................................*/        
        ²
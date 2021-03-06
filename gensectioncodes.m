function [sectiongrdesc, sectiongrindx] = gensectioncodes(cod, typ, sdes)

% Type = 1 : AC1, AC2 ....
% Type = 2 : AC01, AC02 ....
% Type = 3 : AC_1, AC_2 ....
% Type = 4 : AC_01, AC_02 ....

nchar = length(sdes{1});

dfmt{1} = '%u';
dfmt{2} = '%02u';
dfmt{3} = '_%u';
dfmt{4} = '_%02u';

dmftt = dfmt{typ};

for i = 1:100
    tdd = [cod, num2str(i, dmftt)];
    ntdd = length(tdd);
    nspace = nchar - ntdd;
    
    for j=1:nspace;
        tdd = [tdd, ' '];
    end

    dri = find(strcmp(sdes, tdd));
    
    if dri == 0
        break;
    elseif dri ~= 0
        sectiongrdesc{i,1} = tdd;
        sectiongrindx(i,1) = dri;
    end
end

end
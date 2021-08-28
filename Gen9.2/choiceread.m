function [choiceout,choicenum]=choiceread(text)
choice=regexp(text{1,1}, '\s+', 'split');
[~,choicenum]=size(choice);
choiceout=zeros(1,choicenum);
for i=1:choicenum
    choiceout(i)=str2num(choice{1,i});
end

end
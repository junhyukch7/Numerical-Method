function r = polyint(x,y,n)
a = polyfit(x,y,2);
r = polyval(a,n);
end
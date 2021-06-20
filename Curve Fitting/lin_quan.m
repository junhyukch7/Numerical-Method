function [Syx,Sy,r2,r] = lin_quan(x,y,func)
% function [Syx,r2,r] = lin_quan(x,y,func): 선형회귀분석 오차의 정량화
% input:
% x : data, y:data, func : 모델
% 주의 : 변환할 경우 data도 변환해서 입력해야함.
% original moedl: (원래데이터,원래데이터,원래 함수)
% 선형화 모델 : (선형화할때 사용한 데이터,선형화할때사용한데이터,함수)
% output
% Syx : 추정값의 표준오차
% Sy : 표준편차
% r2 : 결정계수
% r : 상관계수

n = length(x);
Sr = sum((y - func(x)).^2);
St = sum((y - mean(y)).^2);
Syx = sqrt(Sr/(n-2));
Sy = sqrt(St/(n-1));
r2 = (St-Sr)/St;
r = sqrt(r2);
end

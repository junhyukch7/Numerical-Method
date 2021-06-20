function [result_A,result_b] = digon_domin(Ab)
% function result = digon_domin(Ab) : 대각지배 형태로 행렬을 바꿈
% input :
% a11 a12 a13 b11
% a21 a22 a23 b12
% a31 a32 a33 b33
% output: 대각지배 형태로 정렬된 input

[mo,no] = size(Ab);
for i=1:mo
    A(i,:) = Ab(i,1:mo);
end
[m,n] = size(A);
if(m~=n), error("matrix must be square"); end
result = [];
i = 1;
cnt = 1; % 적합한 행 성분이 발견되면 결과 행에 추가
cycle_num = 0;
while(1)
    test = A(i,:);
    if(abs(test(1,cnt)) > sum(abs(test(1,:))) - abs(test(1,cnt)))
        result(cnt,:) = Ab(i,:);
        cnt = cnt + 1;
    end
    i = i+1;% 모든 행을 다 돌면서 검사
    if(i>n)
        i = 1;
        cycle_num = cycle_num + 1;
    end
    if(cnt == 1 && cycle_num >1), break; end % 한번 돌았는데도 없다는건, 변경 불가능함
    if(size(result) == size(Ab)), break; end % 정답!!변경완료!
end
% 결과 저장
if(~isempty(result))
    for i=1:n
        result_A(i,:) = result(i,1:n);
        result_b(i,1) = result(i,n+1);
    end 
else
    result_A = [];
    result_b = [];
end
end
    
        
        
    
    
    


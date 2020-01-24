-module(list).
-export([product/1]).

% Insert = [2,3,4].
% Full = [1, Insert].
% Neat = lists:flatten(Full).

% A = [1,2,4].
% B = [8,16,32].
% ListOfLists = [A,B].

% lists:append(A, B).
% A++B

% lists:seq(-2,8)

% D = [1, 2, 3, 4].
% lists:reverse(D).

product([]) -> 0;
product(List) -> product(List, 1).

product([], Product) -> Product;
product([Head | Tail], Product) -> product(Tail, Product * Head).

% L1 = [1,2,3].
% L2 = [4,5,6].
% zipped = lists:zip(L1, L2).
% unzipped = lists:unzip(zipped). {L1, L2} must have same size
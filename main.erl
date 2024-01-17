-module(main).
-import(io,[fwrite/1, format/2]).
-export([factors_helper/2, factors/1, gcf/2, lcm/2, gcf_all/1, lcm_all/1, is_prime/1, prime_factors_helper/2, prime_factorization/1]).

%% Method 1: factors( N )
% factors helper function
factors_helper(Num, Num) -> [Num];
factors_helper(Num, Factor) -> 
  if (Num rem Factor) == 0 -> [Factor | factors_helper(Num, Factor + 1)];
      true -> factors_helper(Num, Factor + 1)
  end.

% factors function
factors( N ) when is_integer(N) -> factors_helper(N, 1);
factors(_) -> error.


%% Method 2: gcf( M, N)
% greatest common factor function
gcf( M, 0 ) when is_integer(M) -> M;
gcf( M, N ) when is_integer(M), is_integer(N) -> gcf(N, M rem N);
gcf(_, _) -> error.


%% Method 3: lcm( M, N)
% least common multiple function
lcm( M, N ) when is_integer(M), is_integer(N) -> (M * N) div gcf(M, N);
lcm(_, _) -> error.


%% Method 4: gcf_all( List )
% greatest common factor all function
gcf_all( [A, B] ) -> gcf(A, B);
gcf_all( [A, B, C]) -> gcf(gcf(A, B), C);
gcf_all( [A, B | T] ) -> gcf(gcf(A, B), gcf_all(T));
gcf_all(_) -> error.


%% Method 5: lcm_all( List )
% least common multiple all function
lcm_all ([A, B]) -> lcm(A, B);
lcm_all([A, B, C]) -> lcm(lcm(A, B), C);
lcm_all([A, B | T]) -> lcm(lcm(A, B), lcm_all(T));
lcm_all(_) -> error.


%% Method 6: is_prime( N )
% whether it is prime function
is_prime( N ) when is_integer(N) -> 
  FactorsList = factors( N ),
  PrimeList = [1, N],
  FactorsList == PrimeList;
is_prime( _ ) -> error.


%% Method 7: prime_factorization( N )
% prime factorization helper function
prime_factors_helper(1, _) -> [];
prime_factors_helper( Num, Factor ) -> 
  if 
    (Num rem Factor) == 0 -> [Factor | prime_factors_helper(Num div Factor, Factor)];
    true -> prime_factors_helper(Num, Factor + 1)
  end.

% prime factorization function
prime_factorization( N ) when is_integer(N) -> prime_factors_helper(N, 2);
prime_factorization( _ ) -> error.



;; sequence(s): A288962
;; terms: 0 1 9 60 250 765 1911 4144 8100 14625 24805 39996 61854 92365 133875 189120 261256 353889 471105 617500
;; small program: ((loop((x - 1) + y, x * x, x) * x) + x) div 2
;; fast program: ((1 + x) * (x * (2 + (((x * x) - x) * x)))) div (2 + 2)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (- x 1) y))))
(assert (forall ((x Int)) (= (g0 x) (* x x))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (divf (+ (* (v0 x) x) x) 2))))
(assert (forall ((x Int)) (= (fast x) (divf (* (+ 1 x) (* x (+ 2 (* (- (* x x) x) x)))) (+ 2 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)

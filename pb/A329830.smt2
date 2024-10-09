;; sequence(s): A329830
;; terms: 2 4 7 9 11 14 16 19 21 23 26 28 31 33 35 38 40 42 45 47
;; small program: 2 + ((((x - ((x - (x div (2 + (2 * (2 + 2))))) div (2 + 2))) div 2) + x) + x)
;; fast program: loop(((2 * ((x + x) + x)) div ((2 * (2 * (2 * (2 + 2)))) - 1)) + x, 1, 2 + (x + x))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 2 (+ (+ (divf (- x (divf (- x (divf x (+ 2 (* 2 (+ 2 2))))) (+ 2 2))) 2) x) x)))))
(assert (forall ((x Int)) (= (f0 x) (+ (divf (* 2 (+ (+ x x) x)) (- (* 2 (* 2 (* 2 (+ 2 2)))) 1)) x))))
(assert (= g0 1))
(assert (forall ((x Int)) (= (h0 x) (+ 2 (+ x x)))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (v0 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)

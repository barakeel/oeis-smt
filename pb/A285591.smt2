;; sequence(s): A285591
;; terms: 2 4 6 8 10 12 13 15 17 19 21 23 25 27 29 31 33 35 36 38
;; small program: ((((((x div (2 * (2 + 2))) - ((x div 2) - 2)) div 2) div 2) + 2) + x) + x
;; fast program: ((loop(((2 - x) + (x div (2 + 2))) div (2 + 2), 1, x div 2) + x) + 2) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (divf (divf (- (divf x (* 2 (+ 2 2))) (- (divf x 2) 2)) 2) 2) 2) x) x))))
(assert (forall ((x Int)) (= (f0 x) (divf (+ (- 2 x) (divf x (+ 2 2))) (+ 2 2)))))
(assert (= g0 1))
(assert (forall ((x Int)) (= (h0 x) (divf x 2))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (v0 x) x) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)

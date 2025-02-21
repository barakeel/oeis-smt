;; sequence(s): A60275
;; terms: 13 14 16 17 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34
;; small program: loop(2 + ((if (2 + (2 - x)) <= 0 then 1 else 0) + x), 1 + (2 + 2), x)
;; fast program: ((if ((x - 1) - 2) <= 0 then (x div 2) else 2) + x) + ((((2 + 2) + 2) * 2) + 1)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 2 (+ (ite (<= (+ 2 (- 2 x)) 0) 1 0) x)))))
(assert (= g0 (+ 1 (+ 2 2))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (ite (<= (- (- x 1) 2) 0) (divf x 2) 2) x) (+ (* (+ (+ 2 2) 2) 2) 1)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)

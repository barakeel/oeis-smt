;; sequence(s): A314838
;; terms: 1 5 9 14 18 23 27 32 37 41 46 50 55 59 64 69 73 78 82 87
;; small program: loop(1 + ((2 * (y + y)) + (((x div 2) div 2) div 2)), x, 1)
;; fast program: loop(((1 + (2 + x)) div (1 + (2 + (2 + 2)))) + (if x <= 0 then 1 else x), 1, 2 * (x + x))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 (+ (* 2 (+ y y)) (divf (divf (divf x 2) 2) 2))))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (f1 x) (+ (divf (+ 1 (+ 2 x)) (+ 1 (+ 2 (+ 2 2)))) (ite (<= x 0) 1 x)))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (* 2 (+ x x)))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (v1 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)

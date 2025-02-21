;; sequence(s): A315309
;; terms: 1 6 10 16 20 26 30 36 42 46 52 56 62 66 72 78 82 88 92 98
;; small program: loop((((x div (1 + (2 * (2 + 2)))) + (y + y)) * 2) + 2, x, 1)
;; fast program: (((((1 + (2 + (2 * (x + x)))) div (1 + (2 + (2 + 2)))) + x) * 2) + (if x <= 0 then 1 else x)) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* (+ (divf x (+ 1 (* 2 (+ 2 2)))) (+ y y)) 2) 2))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* (+ (divf (+ 1 (+ 2 (* 2 (+ x x)))) (+ 1 (+ 2 (+ 2 2)))) x) 2) (ite (<= x 0) 1 x)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)

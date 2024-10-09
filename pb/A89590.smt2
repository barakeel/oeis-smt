;; sequence(s): A89590
;; terms: 0 1 2 3 5 6 7 8 9 10 11 12 13 15 16 17 18 19 20 21
;; small program: 1 + (loop((x - 1) div (1 + 2), 2, x) + x)
;; fast program: x - ((1 + (2 - x)) div (1 + (2 * (2 + 2))))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (divf (- x 1) (+ 1 2)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ 1 (+ (v0 x) x)))))
(assert (forall ((x Int)) (= (fast x) (- x (divf (+ 1 (- 2 x)) (+ 1 (* 2 (+ 2 2))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)

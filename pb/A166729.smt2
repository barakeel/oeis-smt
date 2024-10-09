;; sequence(s): A166729
;; terms: 8 28 38 48 58 68 78 88 98 108 128 138 148 158 168 178 188 198 208 228
;; small program: (((1 + (loop((2 + x) div (1 + 2), 2, x) + x)) * (1 + (2 + 2))) * 2) - 2
;; fast program: (((((x - 1) div (1 + (2 * (2 + 2)))) + 2) + x) * (2 + (2 * (2 + 2)))) - 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (divf (+ 2 x) (+ 1 2)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- (* (* (+ 1 (+ (v0 x) x)) (+ 1 (+ 2 2))) 2) 2))))
(assert (forall ((x Int)) (= (fast x) (- (* (+ (+ (divf (- x 1) (+ 1 (* 2 (+ 2 2)))) 2) x) (+ 2 (* 2 (+ 2 2)))) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)

;; sequence(s): A307766
;; terms: 3 1 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0
;; small program: (1 + ((2 - (x mod (1 + 2))) * (2 + 2))) div (1 + (2 + x))
;; fast program: loop((2 * (x + x)) - 1, 1 - (x mod (1 + 2)), if x <= 0 then 1 else 2) div (1 + x)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (divf (+ 1 (* (- 2 (modf x (+ 1 2))) (+ 2 2))) (+ 1 (+ 2 x))))))
(assert (forall ((x Int)) (= (f0 x) (- (* 2 (+ x x)) 1))))
(assert (forall ((x Int)) (= (g0 x) (- 1 (modf x (+ 1 2))))))
(assert (forall ((x Int)) (= (h0 x) (ite (<= x 0) 1 2))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (divf (v0 x) (+ 1 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)

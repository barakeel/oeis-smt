;; sequence(s): A16729
;; terms: 1 2 2 2 3 4 3 4 4 4 5 6 5 6 6 6 7 8 7 8
;; small program: (((2 + (x mod (2 + (x mod 2)))) + x) div (1 + 2)) + 1
;; fast program: loop((x mod 2) + x, x mod 2, (x - 1) div (1 + 2)) + 2
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
(assert (forall ((x Int)) (= (small x) (+ (divf (+ (+ 2 (modf x (+ 2 (modf x 2)))) x) (+ 1 2)) 1))))
(assert (forall ((x Int)) (= (f0 x) (+ (modf x 2) x))))
(assert (forall ((x Int)) (= (g0 x) (modf x 2))))
(assert (forall ((x Int)) (= (h0 x) (divf (- x 1) (+ 1 2)))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (v0 x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)

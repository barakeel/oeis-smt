;; sequence(s): A300068
;; terms: 0 0 0 1 2 2 3 3 3 4 5 5 6 6 6 7 8 8 9 9
;; small program: (x - ((x mod (1 + 2)) div 2)) div 2
;; fast program: loop(x - 1, (x mod (1 + 2)) - 1, x) div 2
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
(assert (forall ((x Int)) (= (small x) (divf (- x (divf (modf x (+ 1 2)) 2)) 2))))
(assert (forall ((x Int)) (= (f0 x) (- x 1))))
(assert (forall ((x Int)) (= (g0 x) (- (modf x (+ 1 2)) 1))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (divf (v0 x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)

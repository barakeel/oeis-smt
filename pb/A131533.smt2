;; sequence(s): A131533
;; terms: 0 0 0 0 1 ~1 0 0 0 0 1 ~1 0 0 0 0 1 ~1 0 0
;; small program: (((1 + x) mod (1 + 2)) - (x mod 2)) div 2
;; fast program: loop(y - x, 2 - ((2 + x) mod ((2 + 2) + 2)), 1) - 1
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (divf (- (modf (+ 1 x) (+ 1 2)) (modf x 2)) 2))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- y x))))
(assert (forall ((x Int)) (= (g0 x) (- 2 (modf (+ 2 x) (+ (+ 2 2) 2))))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (fast x) (- (v0 x) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)

;; sequence(s): A325689
;; terms: 0 0 0 1 0 6 4 15 12 28 24 45 40 66 60 91 84 120 112 153
;; small program: (1 - loop(y - x, x - 1, 1)) * (2 - x)
;; fast program: (x - 2) * ((1 + (x + x)) mod (1 + (x div 2)))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- y x))))
(assert (forall ((x Int)) (= (g0 x) (- x 1))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (* (- 1 (v0 x)) (- 2 x)))))
(assert (forall ((x Int)) (= (fast x) (* (- x 2) (modf (+ 1 (+ x x)) (+ 1 (divf x 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)

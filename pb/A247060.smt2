;; sequence(s): A247060
;; terms: 1 5 8 12 16 17 21 24 28 32 33 37 40 44 48 49 53 56 60 64
;; small program: loop((((y + y) * ((2 + x) + x)) div ((2 + 2) + y)) + x, 2, x) - x
;; fast program: ((((((((((x + x) div (1 + (2 + 2))) + x) + 1) + (x mod (1 + (2 + 2)))) + x) + x) + x) div 2) + 1) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (divf (* (+ y y) (+ (+ 2 x) x)) (+ (+ 2 2) y)) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (divf (+ (+ (+ (+ (+ (+ (divf (+ x x) (+ 1 (+ 2 2))) x) 1) (modf x (+ 1 (+ 2 2)))) x) x) x) 2) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)

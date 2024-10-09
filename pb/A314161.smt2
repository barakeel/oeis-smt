;; sequence(s): A314161
;; terms: 1 5 11 16 22 28 33 39 44 49 55 60 66 72 77 83 88 93 99 104
;; small program: (loop((((x div 2) mod 2) + y) div 2, x, 1) + (2 * (x + x))) + x
;; fast program: (((((x div (2 + 2)) mod 2) + x) div 2) + (if x <= 0 then 1 else (2 * (x + x)))) + x
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
(assert (forall ((x Int) (y Int)) (= (f0 x y) (divf (+ (modf (divf x 2) 2) y) 2))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (v0 x) (* 2 (+ x x))) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (divf (+ (modf (divf x (+ 2 2)) 2) x) 2) (ite (<= x 0) 1 (* 2 (+ x x)))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)

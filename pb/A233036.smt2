;; sequence(s): A233036
;; terms: 0 0 0 4 6 8 12 16 20 24 30 36 42 48 56 64 72 80 90 100
;; small program: (loop(((((x div 2) mod 2) + y) mod x) + x, x, x) - x) div 2
;; fast program: ((1 + ((2 + x) * (if (x - 2) <= 0 then 1 else x))) div (2 * (2 + 2))) * 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (modf (+ (modf (divf x 2) 2) y) x) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (divf (- (v0 x) x) 2))))
(assert (forall ((x Int)) (= (fast x) (* (divf (+ 1 (* (+ 2 x) (ite (<= (- x 2) 0) 1 x))) (* 2 (+ 2 2))) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)

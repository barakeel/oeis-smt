;; sequence(s): A63105
;; terms: 2 9 15 21 27 35 39 47 53 59 65 73 77 85 91 97 103 111 115 123
;; small program: loop(1 + ((x mod 2) + x), ((x - (x div (1 + 2))) + x) + x, 2 + x)
;; fast program: ((((((x - (x div (1 + 2))) + x) + x) * 2) + 1) + (x mod 2)) + (if x <= 0 then 1 else x)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (+ (modf x 2) x)))))
(assert (forall ((x Int)) (= (g0 x) (+ (+ (- x (divf x (+ 1 2))) x) x))))
(assert (forall ((x Int)) (= (h0 x) (+ 2 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (* (+ (+ (- x (divf x (+ 1 2))) x) x) 2) 1) (modf x 2)) (ite (<= x 0) 1 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)

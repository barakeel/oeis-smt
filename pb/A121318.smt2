;; sequence(s): A121318
;; terms: 0 4 16 38 74 128 204 306 438 604 808 1054 1346 1688 2084 2538 3054 3636 4288 5014
;; small program: loop(((y * y) + (1 mod y)) + x, x, x) * 2
;; fast program: ((((1 + (x + x)) * ((x * x) + x)) div (1 + 2)) + ((2 * 2) * x)) - (if x <= 0 then 0 else 2)
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
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (* y y) (modf 1 y)) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (v0 x) 2))))
(assert (forall ((x Int)) (= (fast x) (- (+ (divf (* (+ 1 (+ x x)) (+ (* x x) x)) (+ 1 2)) (* (* 2 2) x)) (ite (<= x 0) 0 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)

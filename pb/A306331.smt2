;; sequence(s): A306331
;; terms: 6 31 44 69 82 107 120 145 158 183 196 221 234 259 272 297 310 335 348 373
;; small program: loop(((2 + y) * x) + y, 2, (x + x) - (x div 2)) + x
;; fast program: (2 * ((1 + 2) * (1 + ((((x mod 2) + x) + x) + x)))) + x
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
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* (+ 2 y) x) y))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) (- (+ x x) (divf x 2)))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (* 2 (* (+ 1 2) (+ 1 (+ (+ (+ (modf x 2) x) x) x)))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)

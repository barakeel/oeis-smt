;; sequence(s): A342873
;; terms: 0 7 16 62 92 213 276 508 616 995 1160 1722 1956 2737 3052 4088 4496 5823 6336 7990
;; small program: ((((1 + ((2 * ((x mod 2) + x)) + (x mod 2))) * x) + 1) * (1 + x)) div 2
;; fast program: (((((loop(((y mod 2) * 2) + 2, x mod 2, 1) + x) + x) * x) + 1) * (1 + x)) div 2
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
(assert (forall ((x Int)) (= (small x) (divf (* (+ (* (+ 1 (+ (* 2 (+ (modf x 2) x)) (modf x 2))) x) 1) (+ 1 x)) 2))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* (modf y 2) 2) 2))))
(assert (forall ((x Int)) (= (g0 x) (modf x 2))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (fast x) (divf (* (+ (* (+ (+ (v0 x) x) x) x) 1) (+ 1 x)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)

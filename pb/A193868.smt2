;; sequence(s): A193868
;; terms: 2 4 16 22 46 56 92 106 154 172 232 254 326 352 436 466 562 596 704 742
;; small program: loop(1 + (x + y), (x - (x mod 2)) + x, 2)
;; fast program: 1 + ((1 + (x + x)) * (1 + (x - (x mod 2))))
(set-logic UFNIA)
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 (+ x y)))))
(assert (forall ((x Int)) (= (g0 x) (+ (- x (modf x 2)) x))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (* (+ 1 (+ x x)) (+ 1 (- x (modf x 2))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)

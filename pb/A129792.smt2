;; sequence(s): A129792
;; terms: 8 32 171 1024 6554 43691 299594 2097152 14913081 107374183 780903145 5726623062 42288908761 314146179365 2345624805923 17592186044416 132458812569721 1000799917193444 7585009898729257
;; small program: (loop(x + x, 2 + ((x + x) + x), 2) + x) div (1 + x)
;; fast program: (loop((x * x) * x, 1, loop(x + x, x, 2)) + x) div (1 + x)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ x x))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 (+ (+ x x) x)))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (divf (+ (v0 x) x) (+ 1 x)))))
(assert (forall ((x Int)) (= (f1 x) (* (* x x) x))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (f2 x) (+ x x))))
(assert (forall ((x Int)) (= (g2 x) x)))
(assert (= h2 2))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) h2))))
(assert (forall ((x Int)) (= (h1 x) (v2 x))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (divf (+ (v1 x) x) (+ 1 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
